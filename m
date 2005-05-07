From: "Bogdan Vacaliuc" <bvacaliuc@ngit.com>
Subject: RE: CF custom implementation
Date: Sat, 7 May 2005 09:51:30 -0400
Message-ID: <00c901c5530b$e49542a0$0b03a8c0@lithium>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <9DFF23E1E33391449FDC324526D1F259024380CB@sjc1exm02.pmc_nt.nt.pmc-sierra.bc.ca>
Return-Path: <bvacaliuc@ngit.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Kiran Thota' <Kiran_Thota@pmc-sierra.com>, 'Ulrich Eckhardt' <eckhardt@satorlaser.com>, linux-mips@linux-mips.org
Message-ID: <20050507135130.9ZBXxJX2wwIbKzqdP3Uc5_4Y3-8G1gPehDmM5pnaXCo@z>

On Friday, May 06, 2005 1:33 PM, Kiran Thota wrote:

> Another question: If I rework the board so that the wires coming to
> MEMR and MEMW are rewired to IOR and IOW respectively, does it work
> in TrueIDE mode? Just a thought!  

No.  TrueIDE mode changes the meaning of many input/output pins, and thus is significantly different from PCcard IO mode so that
this will not work.

Also, you should bear in mind that (P)IO mode is more similar to IDE mode than it is to memory mode.

To operate the CF/CF+ card in memory mapped mode you will need the following signals:

A[0:10]
D[0:15]
-CD1, -CD2
-CE1, -CE2
-OE
RDY_BUSY
-REG
RESET
-WE
WP

Refer to the "CF+ & CF SPECIFICATION REV. 3.0", pg. 24-30 for details.
http://www.compactflash.org/cfspc3_0.pdf

If your cards are not going to be removable, you can get away with tying up/dn some lines.

Also, please note that on pg. 89, the specification allows for alternate ways that a CF card may 'enter' either trueIDE or memory/io
mode.  Please be aware of this, because certain software implementations may inadvertently cause -OE to stay asserted for an
extended period of time, thus causing the card to spontaneously switch modes.  This results in the card seemingly becoming opaque
until the next reset or power cycle.


Best Regards,

-bogdan
