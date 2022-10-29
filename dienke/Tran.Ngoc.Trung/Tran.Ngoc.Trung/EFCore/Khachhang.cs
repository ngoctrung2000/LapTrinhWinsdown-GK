namespace Tran.Ngoc.Trung.EFCore
{
    public partial class Khachhang
    {
        public Khachhang()
        {
            Dienkes = new HashSet<Dienke>();
        }

        public string Makh { get; set; }
        public string Tenkh { get; set; }
        public string Dienthoai { get; set; }
        public string Diachi { get; set; }

        public virtual ICollection<Dienke> Dienkes { get; set; }
    }
}
