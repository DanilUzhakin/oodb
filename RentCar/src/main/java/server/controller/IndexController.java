package server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import server.entity.Rent;
import server.entity.Client;
import server.repository.RentRepository;
import server.repository.ClientRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {


    @Autowired
    private RentRepository rentRepository;

    @Autowired
    private ClientRepository clientRepository;

    @RequestMapping("/")
    //@Transactional
    public String index(HttpServletRequest request,
                        @ModelAttribute("model") ModelMap model) {
        String path = request.getContextPath();
        model.addAttribute("app_path", path);
        return "/index";
    }

}
