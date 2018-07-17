package main

import (
	"testing"
	"os"
)

func TestNewDeck(t *testing.T) {

	d := newDeck()

	if len(d) != 36 {
		t.Errorf("C'est chelou")
	}

	if d[0] != "Ace de Coeur" {
		t.Errorf("La valeur attendu = %v", d[0])
	}

	if d[len(d) - 1] != "Cinq de Carreau" {
		t.Errorf("La valeur attendu = %v", d[len(d) - 1])
	}
}

func TestSaveToDeckAndNewDeckFromFile(t *testing.T) {

	os.Remove("_decktesting")
	deck := newDeck()

	deck.saveToFile("_decktesting")
	loadedDeck := newDeckFromFile("_decktesting")

	if len(loadedDeck) != 36 {
		t.Errorf("Il faut 36 cartes nous en avons %v ", len(loadedDeck))
	}
	os.Remove("_decktesting")
}