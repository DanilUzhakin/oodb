package server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import server.repository.ClientRepository;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DeleteObjectController {
    @Autowired
    private ClientRepository repository;

    @RequestMapping("/client/delete")
    public String deleteClient(HttpServletRequest request,
                               @RequestParam("clientid") Long clientid,
                               @ModelAttribute("model") ModelMap model) {

        String path = request.getContextPath();

        model.addAttribute("app_path", path);

        repository.removeClient(clientid);
        return "/delobject";
    }

    @RequestMapping("/client/deleterent")
    public String deleteRent(HttpServletRequest request,
                             @RequestParam("id") Long id,
                             @ModelAttribute("model") ModelMap model) {

        String path = request.getContextPath();
        model.addAttribute("app_path", path);
        repository.removeRent(id);
        return "/delobject";
    }

    @RequestMapping("/client/deleteallrents")
    public String deleteAllRents(HttpServletRequest request,
                                 @RequestParam("clientid") Long clientid,
                                 @ModelAttribute("model") ModelMap model) {

        String path = request.getContextPath();

        model.addAttribute("app_path", path);

        repository.removeClientRents(clientid);
        return "/delobject";
    }

    @RequestMapping("/delobject")
    public String delObject(HttpServletRequest request,
                            @ModelAttribute("model") ModelMap model) {

        String path = request.getContextPath();

        model.addAttribute("app_path", path);


        return "/delobject";
    }
}
