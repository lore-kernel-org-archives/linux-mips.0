Message-ID: <01f201c1789d$0f872c00$8061a8c0@oz.agile.tv>
From: "Jim Grohn" <Jim.Grohn@Agile.TV>
Subject: crash from unalgined bad address passed to a syscall 
Date: Thu, 29 Nov 2001 16:14:10 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20011129061410.7YpwD8gwMNDZtTm3MtnYxdNJhUS9xEtHMH3YfQzmkxY@z>

I get a crash when I run the latest LTP.  The test passes 0x1 to getpeername
for namelen (socklen_t*)

I think the problem may be in emulate_load_store_insn.   Should the code
below be passing "pc" to search_exception_table and fixup_exception?
regs->cp0_epc has been adjusted by compute_return_epc (called from do_ade)
to be 4 bytes past the instruction that caused the problems.

*************************
fault:
 /* Did we have an exception handler installed? */
 fixup = search_exception_table(regs->cp0_epc);
 if (fixup) {
  long new_epc;
  new_epc = fixup_exception(dpf_reg, fixup, regs->cp0_epc);
  printk(KERN_DEBUG "%s: Forwarding exception at [<%lx>] (%lx)\n",
         current->comm, regs->cp0_epc, new_epc);
  regs->cp0_epc = new_epc;
  return;
 }
