package com.automation.steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class LoginSteps {

    WebDriver driver;

    @Given("que me encuentro registrado en la página de SwagLabs")
    public void que_me_encuentro_registrado_en_la_pagina_de_swaglabs() {
        driver = new ChromeDriver();
        driver.get("https://www.saucedemo.com/");
    }

    @Given("que me encuentro en la página de SwagLabs")
    public void que_me_encuentro_en_la_pagina_de_swaglabs() {
        driver = new ChromeDriver();
        driver.get("https://www.saucedemo.com/");
    }

    @When("ingreso mi nombre de usuario {string}")
    public void ingreso_mi_nombre_de_usuario(String username) {
        driver.findElement(By.id("user-name")).sendKeys(username);
    }

    @When("ingreso mi contraseña {string}")
    public void ingreso_mi_contrasena(String password) {
        driver.findElement(By.id("password")).sendKeys(password);
    }

    @When("hago click en el botón Login")
    public void hago_click_en_el_boton_login() {
        driver.findElement(By.id("login-button")).click();
    }

    @Then("puedo ingresar a la página principal")
    public void puedo_ingresar_a_la_pagina_principal() {
        String currentUrl = driver.getCurrentUrl();
        assertEquals("https://www.saucedemo.com/inventory.html", currentUrl);
        driver.quit();
    }

    @Then("debería ver el mensaje {string}")
public void deberia_ver_el_mensaje(String mensajeEsperado) {
    String mensajeActual = driver.findElement(By.cssSelector("h3[data-test='error']")).getText();
    assertEquals(mensajeEsperado, mensajeActual, "El mensaje mostrado no es el esperado");
    driver.quit();
}

}
