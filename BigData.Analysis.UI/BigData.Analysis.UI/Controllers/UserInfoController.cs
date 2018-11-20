using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BigData.Analysis.IBLL;
using BigData.Analysis.BLL;


namespace BigData.Analysis.UI.Controllers
{
    public class UserInfoController : Controller
    {
        private IBLL.IUserInfoService _userInfoService = new UserInfoService();
        // GET: UserInfo
        public ActionResult Index()
        {
            return View(); 
        }

        public ActionResult GetAllUserInfo()
        {
            int pageIndex = Request["page"] == null ? 1 : int.Parse(Request["page"]);
            int pageSize = Request["rows"] == null ? 10 : int.Parse(Request["rows"]);
            int total = 0;
            var data = _userInfoService.LoadPageEntities(pageIndex, pageSize, out total, u => true, true, u => u.Id);

            var result = new { total = total, rows = data };
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}