using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BigData.Analysis.IDAL;
using BigData.Analysis.DAL;
using BigData.Analysis.Model;
using BigData.Analysis.IBLL;

namespace BigData.Analysis.BLL
{
    public partial class UserInfoService:BaseService<UserInfo>, IUserInfoService
    {
        //public override void SetCurrentRepository()
        //{
        //    CurrentRepository = DAL.RepositoryFactory.UserInfoRepository;
        //}

        //test
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
