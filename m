From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200209051807.g85I73W06904@coplin09.mips.com>
Subject: Re: 64-bit and N32 kernel interfaces
Date: Thu, 5 Sep 2002 20:07:03 +0200 (CEST)
In-Reply-To: <Pine.GSO.3.96.1020905170830.7444E-100000@delta.ds2.pg.gda.pl> from "Maciej W. Rozycki" at Sep 05, 2002 05:10:51 
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-Path: <hartvige@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Daniel Jacobowitz <dan@debian.org>, Hartvig Ekner <hartvige@mips.com>, "Kevin D. Kissell" <kevink@mips.com>, Tor Arntsen <tor@spacetec.no>, Carsten Langgaard <carstenl@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20020905180703.C1Ul9_VFC7ktfNf_o0VZQ0mvGbQYUoAmQLuVm3O2cd0@z>

Maciej W. Rozycki writes:
> 
> On Thu, 5 Sep 2002, Daniel Jacobowitz wrote:
> 
> > No - the point is that all data types have the same size in N32.  It
> > was created explicitly as a transitional sop for people who didn't want
> > to fix their code, but wanted a performance increase from their 64-bit
> > hardware.
> 
>  Well, what's the performance increase of n32 over o32?  The increased
> number of argument registers?  I doubt it's noticeable in most cases.

The technical benefits of n32 over o32 are:

* More argument registers => less memory traffic, less D-cache use,
	=> faster code

* 64-bit datapath of CPU can be utilized with big impact on certain
  applications

* 32 floating point registers instead of 16 (and more efficient
  parameter passing as well)

/Hartvig
