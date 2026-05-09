import Mathlib

-- Generated from goal prompt
def digits10 (n : ℕ) : List ℕ := Nat.digits 10 n

def sumFactorialDigits (n : ℕ) : ℕ := (digits10 n).map Nat.factorial |>.sum

def isFactorion (n : ℕ) : Prop := n = sumFactorialDigits n
