package com.chusu.apps.controller.business;

import com.chusu.apps.config.Constants;
import com.chusu.apps.controller.BaseAction;
import com.chusu.apps.model.TableList;
import com.chusu.apps.model.business.WxProduct;
import com.chusu.apps.model.sys.SysAdmin;
import com.chusu.apps.service.business.WxProductService;
import org.apache.commons.math3.stat.descriptive.summary.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static com.chusu.platform.util.Upload.Uploadiamge;

@Controller
@RequestMapping("/product/manager")
public class WxProductController extends BaseAction{

    @Autowired
    WxProductService productService;

    /**
     * Description: <br>
     * 产品列表
     *
     * @param model
     * @param currentIndex
     * @return <br>
     */
    @RequestMapping("/list")
    public String selectList(ModelMap model, Integer currentIndex, WxProduct product) {
        model.put("oneMenu", session.getAttribute("menu") );
        model.put("product", product);
        return "business/productlist";
    }

    @RequestMapping("/list2")
    public String selectList2(ModelMap model, Integer currentIndex, WxProduct product) {
        product = productService.selectByPrimaryKey(3);
        Object list =  productService.selectWxProduct();
        model.put("oneMenu", session.getAttribute("menu") );
        model.put("list",list);
        model.put("product", product);
        return "business/product_list2";

    }


    @RequestMapping(value = "/jsonlist", method = RequestMethod.POST)
    @ResponseBody
    public TableList<WxProduct> selectjsonlist(WxProduct product, Integer start, Integer length) {
        return  productService.selectWxProductList(start,length,product);
    }
    /**
     * Description: <br>
     * 前往修改或新增角色界面
     *
     * @param model
     * @param id
     * @return <br>
     */
    @RequestMapping("/propage")
    public String add(ModelMap model, Integer id,WxProduct product) {
        SysAdmin admin = (SysAdmin) session.getAttribute(Constants.key.BACKEND_USER_SESSION_KEY);
        product.setCreateUser(admin.getUsername());
        if (id != null) {
            product = productService.selectByPrimaryKey(id);
        }
        model.put("oneMenu", session.getAttribute("menu") );
        model.put("product", product);

        return "business/product_edit";
    }

    /**
     * Description: <br>
     * 修改或新增
     *
     * @param model
     * @return <br>
     */
    @RequestMapping(value = "/merge" , method = RequestMethod.POST)
    @ResponseBody
    public String saveOrUpdate(ModelMap model, WxProduct record, @RequestParam("myfile") MultipartFile myfile,@RequestParam("createUser") String createUser,@RequestParam("proName") String proName,@RequestParam("introduce") String introduce) {
        String imageurl =  Uploadiamge(myfile);
        SysAdmin admin = (SysAdmin) session.getAttribute(Constants.key.BACKEND_USER_SESSION_KEY);
        record.setCreateUser(admin.getUsername());
        record.setIntroduce(introduce);
        record.setProName(proName);
        record.setImageurl(imageurl);
        return productService.saveOrUpdate(record);
    }

    /**
     * Description: <br>
     * 删除
     *
     * @param id
     * @return <br>
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public String delete(Integer id) {
        return productService.delete(id);
    }

    /**
     * Description: <br>
     * 前往详情页面
     *
     * @param model
     * @param id
     * @return <br>
     */
    @RequestMapping("/detaile")
    public String detaile(ModelMap model, Integer id,WxProduct product) {
        if (id != null) {
            product = productService.selectByPrimaryKey(id);
        }
        model.put("oneMenu", session.getAttribute("menu") );
        model.put("product", product);
        return "business/product_detailes";
    }

}
