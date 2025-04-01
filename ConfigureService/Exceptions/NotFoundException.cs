/// <summary>
/// استثنای سفارسی برای که اطلاعات یافت نشد
/// </summary>
public class NotFoundException : Exception
{
    /// <summary>
    /// ایجاد نمونه جدید از استثنایی عدم یافتن
    /// </summary>
    /// <param name="message"></param>
    public NotFoundException(string message) : base(message) { }
}