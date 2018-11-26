using BigData.Analysis.BLL;
using BigData.Analysis.Common;
using BigData.Analysis.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BigData.Analysis.UI.Controllers
{
    public class LoginController : Controller
    {
        private IBLL.IUserInfoService _userInfoService = new UserInfoService();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 验证码的实现
        /// </summary>
        /// <returns></returns> 
       
        public ActionResult CheckCode()
        {
            //首先实例化验证码的类
            ValidateCode validateCode = new ValidateCode();
            //生成验证码指定的长度
            string code = validateCode.CreateValidateCode(5);

            //将验证码赋值给Session变量
            Session["ValidateCode"] = code;

            //创建验证码的图片
            byte[] bytes = validateCode.CreateValidateGraphic(code);

            //最后将验证码返回
            return File(bytes, @"image/jpeg");
        }

        [HttpPost]
        public ActionResult CheckUserInfo(UserInfo userInfo, string Code)
        {
            string sessionCode = this.Session["ValidateCode"] == null
                ? new Guid().ToString()
                : (this.Session["ValidateCode"] as string);

            //去掉验证码，避免暴力破解
           this.Session["ValidateCode"] = new Guid();
            //判断用户输入验证码是否正确
            if (sessionCode != Code)
            {
                return Content("验证码不正确");
            }

            string UserInfoError = "";
            //调用业务逻辑层（BLL)去校验用户是否正确
            var loginUserInfo = _userInfoService.CheckUserInfo(userInfo);
           switch(loginUserInfo)
            {
                case LoginResult.PwdError:
                    UserInfoError = "密码输入错误";
                    break;
                case LoginResult.UserIsNull:
                    UserInfoError = "用户名不能为空";
                    break;
                case LoginResult.UserNotExist:
                    UserInfoError = "用户名错误";
                    break;
                case LoginResult.PwdIsNull:
                    UserInfoError = "密码不能为空";
                    break;
                case LoginResult.OK:
                    UserInfoError = "OK";
                    break;
                default:
                    UserInfoError = "未知错误，请检查数据库";
                    break;
            }

            return Content(UserInfoError);
        }
    }
}