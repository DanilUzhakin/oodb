package server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import server.entity.ClientData;
import server.repository.ClientRepository;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SearchController {
    @Autowired
    private ClientRepository repository;

    @RequestMapping("/clientbyname")
    public String clientByName(HttpServletRequest request,
                               @RequestParam(value = "name", required = false) String name,
                               @ModelAttribute("model")ModelMap model){
        String path = request.getContextPath();
        model.addAttribute("app_path", path);
        if(name != null){
            List<ClientData> clients = repository.findByName(name);
            model.addAttribute("clients", clients);
        }
        return "/clientbyname";
    }

}
