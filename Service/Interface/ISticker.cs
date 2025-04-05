/// <summary>
/// سرویس استیکر
/// </summary>
public interface ISticker
{
    /// <summary>
    /// حذف استیکر
    /// </summary>
    /// <param name="StickerID"></param>
    /// <returns></returns>
    Task<int> StickersDelete(int StickerID);
    /// <summary>
    /// 
    /// </summary>
    /// <param name="StickerID"></param>
    /// <returns></returns>
    Task<VM_Stickers?> StickersFindByID(int StickerID);
    /// <summary>
    /// نمایش همه استیکر ها
    /// </summary>
    /// <returns></returns>
    Task<IEnumerable<VM_Stickers>> StickersGetAll(Props_Pagination pagination);
    /// <summary>
    /// ذخیره استیکر
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    Task<VM_Stickers> StickersInsert(VM_Stickers_Insert model);
    /// <summary>
    /// ویرایش استیکر
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    Task<VM_Stickers> StickersUpdate(VM_Stickers_Update model);
}