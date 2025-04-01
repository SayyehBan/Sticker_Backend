/// <summary>
/// کلاس مدل برای استیکر
/// </summary>
public class VM_Stickers
{
    /// <summary>
    /// شناسه استیکر
    /// </summary>
    public int StickerID { get; set; }
    /// <summary>
    /// عنوان استیکر
    /// </summary>
    public string? Title { get; set; }
    /// <summary>
    /// قیمت استیکر
    /// </summary>
    public decimal Price { get; set; }
    /// <summary>
    /// توضیحات استیکر
    /// </summary>
    public string? Description { get; set; }
    /// <summary>
    /// مسیر تصویر استیکر
    /// </summary>
    public string? Sticker { get; set; }
    /// <summary>
    /// تاریخ و زمان درج
    /// </summary>
    public DateTime CreatedDate { get; set; }
}
/// <summary>
/// ذخیره سازی استیکر
/// </summary>
public class VM_Stickers_Insert : UploadFile
{
    /// <summary>
    /// عنوان استیکر
    /// </summary>
    public string? Title { get; set; }
    /// <summary>
    /// قیمت استیکر
    /// </summary>
    public decimal Price { get; set; }
    /// <summary>
    /// توضیحات استیکر
    /// </summary>
    public string? Description { get; set; }
    /// <summary>
    /// مسیر تصویر استیکر
    /// </summary>
    public string? Sticker { get; set; }
}
/// <summary>
/// به‌روزرسانی استیکر
/// </summary>
public class VM_Stickers_Update : UploadFile
{
    /// <summary>
    /// شناسه استیکر
    /// </summary>
    public int StickerID { get; set; }
    /// <summary>
    /// عنوان استیکر
    /// </summary>
    public string? Title { get; set; }
    /// <summary>
    /// قیمت استیکر
    /// </summary>
    public decimal Price { get; set; }
    /// <summary>
    /// توضیحات استیکر
    /// </summary>
    public string? Description { get; set; }
    /// <summary>
    /// مسیر تصویر استیکر
    /// </summary>
    public string? Sticker { get; set; }
}