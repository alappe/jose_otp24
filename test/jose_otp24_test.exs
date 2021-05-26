defmodule JoseOtp24Test do
  use ExUnit.Case
  doctest JoseOtp24

  test "block_decrypt" do
    jwk = JOSE.JWK.from(%{"k" => "STlqtIOhWJjoVnYjUjxFLZ6oN1oB70QARGSTWQ_5XgM", "kty" => "oct"})

    res =
      JOSE.JWE.block_decrypt(
        jwk,
        "eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..jBt5tTa1Q0N3uFPEkf30MQ.Ei49MvTLLje7bsZ5EZCZMA.gMWOAmhZSq9ksHCZm6VSoA"
      )

    assert res ==
             {"{}",
              %JOSE.JWE{
                alg: {:jose_jwe_alg_dir, :dir},
                enc:
                  {:jose_jwe_enc_aes,
                   {:jose_jwe_enc_aes, {:aes_cbc, 128}, 256, 32, 16, 16, 16, 16, :sha256}},
                fields: %{},
                zip: :undefined
              }}
  end
end
