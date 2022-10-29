using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Tran.Ngoc.Trung.EFCore;
using Tran.Ngoc.Trung.Models;

namespace Tran.Ngoc.Trung.Controllers
{
    public class DienKeController : Controller
    {
        private readonly ILogger<DienKeController> _logger;
        private readonly csdl_dienkeContext _context;

        public DienKeController(ILogger<DienKeController> logger, csdl_dienkeContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            var dienkes = _context.Dienkes.ToList();
            return View(dienkes);
        }

        public IActionResult Add()
        {
            ViewData["KhachHangs"] = _context.Khachhangs.ToList();
            return View(new Dienke());
        }

        [HttpPost]
        [AutoValidateAntiforgeryToken]
        public IActionResult Add(Dienke dienke)
        {
            var err = new List<string>();
            if (string.IsNullOrEmpty(dienke.Madk))
                err.Add("Mã điện kế không được để trống");
            if (!dienke.Ngaydk.HasValue)
                err.Add("Ngày đăng ký không được để trống");
            if (_context.Dienkes.Any(x => x.Madk == dienke.Madk))
                err.Add("Lỗi trùng khóa chính");
            if (err.Any())
            {
                ViewData["KhachHangs"] = _context.Khachhangs.ToList();
                ViewData["err"] = err;
                return View(dienke);
            }    

            _context.Dienkes.Add(dienke);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Delete(string madk)
        {
            Dienke dienke = _context.Dienkes.FirstOrDefault(x => x.Madk == madk);
            if(dienke == null)
                return RedirectToAction("Index");
            return View(dienke);
        }

        public IActionResult Deleted(string madk)
        {
            Dienke dienke = _context.Dienkes.FirstOrDefault(x => x.Madk == madk);
            if (dienke == null)
                return RedirectToAction("Index");

            _context.Dienkes.Remove(dienke);
            _context.SaveChanges();
            return View(dienke);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}