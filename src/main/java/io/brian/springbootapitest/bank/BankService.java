package io.brian.springbootapitest.bank;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class BankService {
	private List<Bank> banks = new ArrayList<Bank>(
			Arrays.asList(new Bank("0", "HSBC", "Banco HSBC"),
					new Bank("1", "Galicia", "Banco Galicia"), new Bank("2", "Nacion", "Banco Nacion")));

	public List<Bank> getAllBanks() {
		return this.banks;
	}

	public Bank getBank(String id) {
		return this.banks.stream().filter(t -> t.getId().equals(id)).findFirst().get();
	}

	public void addBank(Bank bank) {
		this.banks.add(bank);
	}

	public void updateBank(String id, Bank bank) {
		for (int i = 0; i < banks.size(); i++) {
			Bank t = banks.get(i);
			if (t.getId().equals(id)) {
				banks.set(i, bank);
				return;
			}
		}
	}

	public void deleteBank(String id) {
		for (Bank t : banks) {
			if (t.getId().equals(id)) {
				banks.remove(t);
				return;
			}
		}
	}
}
