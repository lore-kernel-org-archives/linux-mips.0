Received: (from root@localhost)
	by krt.neobee.net (8.11.6/8.11.4) id h139SOu27696
	for linux-mips@linux-mips.org; Mon, 3 Feb 2003 10:28:24 +0100
Received: from stanojevic ([192.168.0.224])
	by krt.neobee.net (8.11.6/8.11.4) with SMTP id h139SHd27667
	for <linux-mips@linux-mips.org>; Mon, 3 Feb 2003 10:28:23 +0100
Message-ID: <001701c2cb62$3eccd500$e000a8c0@micronasnit.com>
From: "Nemanja Popov" <Nemanja.Popov@micronasnit.com>
Subject: Lexra' s MMU
Date: Mon, 3 Feb 2003 09:57:02 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <Nemanja.Popov@micronasnit.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030203085702.mNfN99b_AIJW3e4qkWOHpeIxFITbCL7FwI0ExVa6OR0@z>

Hi all !
  Does Lexra's CPU LX4280 has MMU. I've found from dateaheet LX4280 that
there is only SMMU (S stands for Simple) which does not include TLB and
exceptions related to that.
  I've noticed port for lexra (among others also for LX4280) on cvs. Is it
possible to run linux on that kind of processor, and if so will it manage
user space application as it should  with mmu.
  Thanx.
