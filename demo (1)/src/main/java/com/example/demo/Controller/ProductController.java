package com.example.demo.Controller;


import com.example.demo.Entity.Product;
import com.example.demo.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping(path = "/allProduct")
    public List<Product> getAllProduct(){
        return productService.getAll();
    }

    @GetMapping(path = "/title/{title}")
    public List<Product> getProductByTitle(@PathVariable ("title") String title){
        return productService.findByTitle(title);

    }

    @DeleteMapping(path = "/delete/{id}")
    public ResponseEntity<?> deleteById(@PathVariable ("id") Integer id){
        try{
            productService.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);
        }
    }
}
