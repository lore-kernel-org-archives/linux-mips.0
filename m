Subject: Re: Linux on LSI EZ4102
Date: Wed, 18 Apr 2001 22:11:42 +0100 (BST)
In-Reply-To: <20010418132323.A25356@foobazco.org> from "Keith M Wesolowski" at Apr 18, 2001 01:23:24 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14pzEm-0005jl-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Keith M Wesolowski <wesolows@foobazco.org>
Cc: Ralph Metzler <rjkm@convergence.de>, Quinn Jensen <jensenq@Lineo.COM>, linux-mips@oss.sgi.com
Message-ID: <20010418211142.-C1_N0YG0evtWMuZRPqVrqIS0wUQpXp6F4XeLRcn4XY@z>

> Any -ac kernel contains at most the same changes that are in the oss
> tree.  Trees other than the oss one, including ac, are likely to
> contain more bugs.

-ac has all the stuff Ralf has sent me. Linus has most of that. In some
ways -ac has less bugs (eg the oss tree has serious disk corruption bugs -ac
doesnt) but I certainly cant guarantee -ac will always build on mips, and 
right now with the sem changes it quite probably wont.

Alan
