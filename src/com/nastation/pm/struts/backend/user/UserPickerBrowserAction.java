package com.nastation.pm.struts.backend.user;

import java.util.List;

import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserPickerBrowserAction extends ActionSupport {
    private String element;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element;
    }

    @Override
    public String execute() throws Exception {
        UserBO userBO = UserBO.getUserBO();
        List<Userhbm> list = userBO.viewUsers();
        setFlag(list == null || list.size() == 0);

        ActionContext cx = ActionContext.getContext();
        cx.put("userList", list);

        return SUCCESS;
    }

}
