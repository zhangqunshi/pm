package com.nastation.pm.business;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.beanhbm.ProjectCategoryhbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.util.SessionF;

public class ProjectCategoryBO {

    public static ProjectCategoryBO getProjectCategoryBO() {
        return new ProjectCategoryBO();
    }

    /**
     * 创建一个项目类型
     */

    public void addProjectCategory(ProjectCategoryhbm category) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(category);
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
    }

    /**
     * 通过一个ID获得对应的项目类型
     */

    public ProjectCategoryhbm getProjectCategory(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        ProjectCategoryhbm pc2 = null;
        try {
            tx = session.beginTransaction();
            pc2 = session.load(ProjectCategoryhbm.class, id);
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return pc2;
    }

    /**
     * 检查是否创建了同名项目种类
     */

    public boolean checkProjectCategory(ProjectCategoryhbm category) {
        boolean flag = true;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            ProjectCategoryhbm pc = (ProjectCategoryhbm) session
                    .createQuery("from ProjectCategoryhbm as p where p.name=:name")
                    .setString("name", category.getName()).setMaxResults(1).uniqueResult();
            tx.commit();
            if (pc != null) {
                flag = false;
            }
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return flag;
    }

    /**
     * 获得数据库中所有的项目种类信息
     */

    public List<ProjectCategoryhbm> getCategoryList() {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<ProjectCategoryhbm> pcList = null;
        try {
            tx = session.beginTransaction();
            pcList = session.createQuery("from ProjectCategoryhbm").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return pcList;
    }

    /**
     * 删除对应ID的项目种类
     */

    public void deleteCategory(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(session.load(ProjectCategoryhbm.class, id));
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
    }

    /**
     * 更新项目种类
     */

    public void updateCategory(ProjectCategoryhbm category) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(category);
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
    }

    /**
     * 通过名字获得一个项目分类
     * 
     */

    public ProjectCategoryhbm getProjectCategory(String name) {
        ProjectCategoryhbm category = null;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            category = (ProjectCategoryhbm) session.createQuery("from ProjectCategoryhbm as p where p.name=:name")
                    .setString("name", name).uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return category;
    }

    /**
     * 查询与此分类有关的所有项目
     */

    public List<Projecthbm> getAllProject(int categoryId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<Projecthbm> pList = null;
        try {
            tx = session.beginTransaction();
            pList = session.createQuery("from Projecthbm as p where p.category.id=:id").setInteger("id", categoryId)
                    .list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return pList;
    }

    /**
     * 删除与项目有关联的项目分类
     */

    public void deleteProjectCategoryForLinkProject(int id) {
        this.deleteCategory(id);
    }

    /**
     * 判断此分类是否与其他项目有关联
     */

    public boolean checkLinkProject(int categoryId) {
        boolean flag = false;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        Projecthbm proj = null;
        try {
            tx = session.beginTransaction();
            proj = (Projecthbm) session.createQuery("from Projecthbm as p where p.category.id=:id")
                    .setInteger("id", categoryId).setMaxResults(1).uniqueResult();
            tx.commit();

            if (proj != null) {
                flag = true;
            }
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return flag;
    }

    /**
     * 判断名字是否已经存在
     * 
     */

    public boolean exists(String name) {
        boolean flag = false;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            ProjectCategoryhbm pc = (ProjectCategoryhbm) session
                    .createQuery("from ProjectCategoryhbm as p where p.name=:name").setString("name", name)
                    .setMaxResults(1).uniqueResult();
            tx.commit();
            if (pc != null) {
                flag = true;
            }
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return flag;
    }

}
