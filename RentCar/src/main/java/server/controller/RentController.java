package server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
public class RentController {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private RentRepository rentRepository;


    @RequestMapping("/addrent")
    @Transactional
    public String clientByName(HttpServletRequest request,
                               @RequestParam(value = "id", required = false) Long id,
                               @RequestParam(value = "car", required = false) String car,
                               @ModelAttribute("model") ModelMap model)
    {

        String path = request.getContextPath();
        model.addAttribute("app_path", path);

        Client client = null;
        if (id != null) {
            client = clientRepository.findById(id);

            if (client != null) {
                Rent rent = new Rent();
                rent.setRentcar( car );
                rentRepository.save(rent);

                client.getRents().add(rent);
                clientRepository.save( client );
            }

            List<Rent> Rents = clientRepository.getClientRents( client );
            model.addAttribute("Rents", Rents);

        } else {
            client = new Client();
        }

        model.addAttribute("client", client);

        return "/client";
    }




}
