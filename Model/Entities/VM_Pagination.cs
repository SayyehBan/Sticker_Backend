/// <summary>
/// کلاس مدل برای نمایش لیست با پیجینیشن
/// </summary>
public class VM_Pagination
{
    /// <summary>
    /// تعداد کل رکوردها
    /// </summary>
    public int TotalRecords { get; set; }
    /// <summary>
    /// تعداد کل صفحات
    /// </summary>
    public int TotalPages { get; set; }
    /// <summary>
    /// صفحه جاری
    /// </summary>
    public int CurrentPage { get; set; }
    /// <summary>
    /// تعداد صفحه‌ها در هر صفحه نمایش داده شود
    /// </summary>
    public int PageSize { get; set; }
}
/// <summary>
/// پارامترهای صفحه بندی
/// </summary>
public class Props_Pagination
{
    /// <summary>
    /// شماره صفحه
    /// </summary>
    public int PageNumber { get; set; }
    /// <summary>
    /// تعداد رکورد در هر صفحه نمایش داده شود
    /// </summary>
    public int PageSize { get; set; }
}