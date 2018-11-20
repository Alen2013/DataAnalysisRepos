using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BigData.Analysis.IDAL
{
    public interface IBaseRepository<T> where T : class, new()
    {
        //添加
        T AddEntity(T entity);
       //修改
        bool UpdateEntity(T entity);
       //删除
        bool DeleteEntity(T entity);
        //简单查询
        IQueryable<T> LoadEntities(Func<T, bool> whereLambda);
        //分页查询
        IQueryable<T> LoadPageEntities<S>(int pageIndex, int pageSize, out int total, Func<T, bool> whereLambda, bool isAsc, Func<T, S> orderByLambda);
       
    }
}
