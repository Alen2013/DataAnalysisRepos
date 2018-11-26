using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BigData.Analysis.IDAL;
using BigData.Analysis.DAL;
using System.Linq.Expressions;

namespace BigData.Analysis.BLL
{
    public abstract class BaseService<T> where T : class, new()
    {
        //当前仓储
        public IBaseRepository<T> CurrentRepository { get; set; }

        //DbSession的存放
        public DbSession _DbSession = new DbSession();
        //基类构造函数
        public BaseService()
        {
            SetCurrentRepository();
        }

        //约束
        public abstract void SetCurrentRepository();  //子类必须实现

        //实现数据库的添加功能
        public T AddEntity(T entity)
        {
            //调用T对应的仓储来做添加工作
            // return CurrentRepository.AddEntity(entity);
            var AddEntity = CurrentRepository.AddEntity(entity);
            _DbSession.SaveChanges();
            return AddEntity;
        }

        public bool UpdateEntity(T entity)
        {
            CurrentRepository.UpdateEntity(entity);
            return _DbSession.SaveChanges() > 0;
        }

        public bool DeleteEntity(T entity)
        {
             CurrentRepository.DeleteEntity(entity);
            return _DbSession.SaveChanges() > 0;
        }

        public IQueryable<T> LoadEntities(Expression<Func<T, bool>> whereLambda)
        {
            return CurrentRepository.LoadEntities(whereLambda);
        }

        public IQueryable<T> LoadPageEntities<S>(int pageIndex, int pageSize, out int total, Expression<Func<T, bool>> whereLambda, bool isAsc, Expression<Func<T, S>> orderByLambda)
        {
            return CurrentRepository.LoadPageEntities(pageIndex, pageSize, out total, whereLambda, isAsc, orderByLambda);
        }
    }
}
