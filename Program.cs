using System.Globalization;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.SwaggerUI;

var builder = WebApplication.CreateBuilder(args);
//پیاده سازی cors
builder.Services.AddCors(options =>
{
    options.AddPolicy("ClientPermission", policy =>
    {
        policy.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod();
    });
});
//پیاده سازی مدل ستیت
builder.Services.Configure<ApiBehaviorOptions>(options =>
{
    options.SuppressModelStateInvalidFilter = true;
});
//پیاده سازی تاریخ و زمان فقط میلادی باشه
builder.Services.Configure<RequestLocalizationOptions>(options =>
{
    options.DefaultRequestCulture = new RequestCulture("en-US");
    options.SupportedCultures = new List<CultureInfo>{
        new CultureInfo("en-US"),
    };
    options.RequestCultureProviders = new List<IRequestCultureProvider>();
});
//پیاده سازی حداکثر سایز فایل ها
builder.Services.Configure<FormOptions>(options =>
{
    options.ValueLengthLimit = int.MaxValue;
    options.MultipartBodyLengthLimit = int.MaxValue;
    options.MultipartHeadersLengthLimit = int.MaxValue;
});

//پیاده سازی مدل های پیش فرض کنترلر ها
builder.Services.AddControllers();

//پیاده سازی سرویس های پیش فرض
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddOurSwagger();
//پیکربندی سرویس ها
var configureTransient = new ConfigureTransient();
configureTransient.ConfigureTransients(builder.Services);

builder.Services.AddOpenApi();

var app = builder.Build();

app.UseCors(builder => builder.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod());
app.UseSwagger();
app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
    c.DocExpansion(DocExpansion.None);
});

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}
app.UseStaticFiles();
app.UseRouting();
app.UseCors("ClientPermission");

app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
