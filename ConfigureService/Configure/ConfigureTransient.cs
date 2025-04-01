/// <summary>
/// کلاس پیکربندی سرویس‌های موقت
/// </summary>
public class ConfigureTransient
{
    /// <summary>
    /// پیکربندی سرویس‌های موقت در کانتینر DI
    /// </summary>
    /// <param name="services">کالکشن سرویس‌ها</param>
    public void ConfigureTransients(IServiceCollection services)
    {
        services.AddTransient<RSticker>();
    }
}
