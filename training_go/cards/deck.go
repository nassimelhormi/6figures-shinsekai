package main

import (
	"fmt"
	"strings"
	"io/ioutil"
	"os"
	"math/rand"
	"time"
)

// type of deck
// which is a slice of strings
type deck []string

func newDeck() deck {

	cards := deck{}
	cardSuit := []string{"Coeur", "Trèfle", "Pique", "Carreau"}
	cardValue := []string{"Ace", "Roi", "Reine", "Vallet", "Un", "Deux", "Trois", "Quatre", "Cinq"}

	for _, suit := range cardSuit {
		for _, value := range cardValue {
			cards = append(cards, value + " de " + suit)
		}
	}

	return cards
}

func deal(d deck, handSize int) (deck, deck) {

	return d[:handSize], d[handSize:]
}

func (d deck) print() {

	for i, card := range d {
		fmt.Println(i, card)
	}
}

func (d deck) toString() string {

	return strings.Join([]string(d), ",")
}

func (d deck) saveToFile(filename string) error {

	return ioutil.WriteFile(filename, []byte(d.toString()),0666)
}

func newDeckFromFile(filename string) deck {

	byteSlice, error := ioutil.ReadFile(filename)

	if error != nil {
		fmt.Println("Error : ",error);
		os.Exit(1)
	}
	s := strings.Split(string(byteSlice), ",")

	return deck(s)
}

func (d deck) shuffle() {

	source := rand.NewSource(time.Now().UnixNano())
	r := rand.New(source)

	for i := range d {
		newPosition := r.Intn(len(d) - 1)

		d[i], d[newPosition] = d[newPosition], d[i]
	}
}