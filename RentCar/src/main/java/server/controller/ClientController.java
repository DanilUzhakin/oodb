package server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import server.entity.Rent;
import server.entity.Client;
import server.repository.RentRepository;
import server.repository.ClientRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ClientController {

    @Autowired
    private ClientRepository repository;

    @Autowired
    private RentRepository rentRepository;


    @RequestMapping("/client")
    public String clients(HttpServletRequest request, @ModelAttribute("model") ModelMap model) {

        String path = request.getContextPath();

        model.addAttribute("app_path", path);

        List<Client> clients = repository.findAll();

        model.addAttribute("clients", clients);

        return "/clients";
    }



    @RequestMapping("/addclient")
    public String clientByName(HttpServletRequest request,
                               @RequestParam(value = "id", required = false) Long id,
                               @RequestParam(value = "name", required = false) String name,
                               @RequestParam(value = "address", required = false) String address,
                               @RequestParam(value = "passport", required = false) String passport,
                               @ModelAttribute("model") ModelMap model)
    {
        String path = request.getContextPath();
        model.addAttribute("app_path", path);
        Client client = null;
        if (id != null) {
            client = repository.findById(id);
        }

        if (client == null) {
            client = new Client();
        }

        if ( address != null || name != null || passport != null) {
            client.setAddress(address);
            client.setName(name);
            client.setPassport(passport);
            client = repository.save(client);
        }

        if (client.getId() != null) {
            List<Rent> Rents = repository.getClientRents(client);
            model.addAttribute("Rents", Rents);
        }

        model.addAttribute("client", client);
        return "/client";
    }




}
