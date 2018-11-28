using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BigData.Analysis.IDAL;
using BigData.Analysis.DAL;
using BigData.Analysis.Model;
using BigData.Analysis.IBLL;
using BigData.Analysis.Common;

namespace BigData.Analysis.BLL
{
    public partial class UserInfoService:BaseService<UserInfo>, IUserInfoService
    {
        public LoginResult CheckUserID(string UserID)
        {
            if(string.IsNullOrEmpty(UserID))
            {
                return LoginResult.UserIsNull;
            }

            var checkUserID = _DbSession.UserInfoRepository.LoadEntities(u => u.CardId == UserID).FirstOrDefault();
            if(checkUserID != null)
            {
                return LoginResult.UserExist;
            }
            else
            {
                return LoginResult.OK;
            }
        }

        public LoginResult CheckUserInfo(UserInfo userInfo)
        {
            if(string.IsNullOrEmpty(userInfo.UserName))
            {
                return LoginResult.UserIsNull;
            }

            if (string.IsNullOrEmpty(userInfo.UserPwd))
            {
                return LoginResult.PwdIsNull;
            }

            //如果不为空的话则去数据库中查询信息
            //在这里会去数据库检查是否有数据，如果没有的话就会返回一个空值
            var LoginUserInfoCheck = _DbSession.UserInfoRepository.LoadEntities(u => u.UserName == userInfo.UserName && u.UserPwd == userInfo.UserPwd).FirstOrDefault();
            //对返回结果判断
            if (LoginUserInfoCheck == null)
            {
                return LoginResult.UserNotExist;
            }

            if(LoginUserInfoCheck.UserPwd != userInfo.UserPwd)
            {
                return LoginResult.PwdError;
            }

            else
            {
                return LoginResult.OK;
            }
            // return _DbSession.UserInfoRepository.LoadEntities(u => u.UserName == userInfo.UserName && u.UserPwd == userInfo.UserPwd).FirstOrDefault();
        }
        //public override void SetCurrentRepository()
        //{
        //    CurrentRepository = DAL.RepositoryFactory.UserInfoRepository;
        //}


        //访问DAL实现CRUD
        //private UserInfoRepository _userInfoRepository = new UserInfoRepository();
        //依赖接口
        //private IUserInfoRepository _userInfoRepository = RepositoryFactory.UserInfoRepository;

        //public UserInfo AddUserInfo(UserInfo userInfo)
        //{
        //    return _userInfoRepository.AddEntity(userInfo);
        //}

        //public bool UpdateUserInfo(UserInfo userInfo)
        //{
        //    return _userInfoRepository.UpdateEntity(userInfo);
        //}
    }
}
