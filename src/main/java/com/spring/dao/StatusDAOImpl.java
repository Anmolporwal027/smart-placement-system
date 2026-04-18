package com.spring.dao;
import com.spring.entity.StudentCompanyStatus;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public class StatusDAOImpl implements StatusDAO {
    @Autowired private SessionFactory sf;
    public void saveOrUpdate(StudentCompanyStatus scs) { 
    	sf.getCurrentSession().saveOrUpdate(scs);
    }
    public List<StudentCompanyStatus> getByStudent(int sid) {
        return sf.getCurrentSession().createQuery("from StudentCompanyStatus where student.id=:s", StudentCompanyStatus.class).setParameter("s", sid).list();
    }
    public StudentCompanyStatus getByStudentAndCompany(int sid, int cid) {
        return sf.getCurrentSession().createQuery("from StudentCompanyStatus where student.id=:s and company.id=:c", StudentCompanyStatus.class).setParameter("s", sid).setParameter("c", cid).uniqueResult();
    } 
    @Override
    public List<StudentCompanyStatus> getShortlistedByCompany(int cid) {
        return sf.getCurrentSession()
                 .createQuery("from StudentCompanyStatus where company.id=:c and status='Shortlisted'", StudentCompanyStatus.class)
                 .setParameter("c", cid)
                 .list();
    }
}