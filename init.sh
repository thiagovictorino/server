#!/bin/bash
vagrant box add webserver2 http://images.pontual.taxi.br:8081/debian7.box
vagrant plugin install vagrant-persistent-storage
vagrant up
vagrant provision
