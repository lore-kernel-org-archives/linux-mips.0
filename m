Subject: Re: Mips IRQ support
From: Pete Popov <ppopov@pacbell.net>
In-Reply-To: <CBD6266EA291D5118144009027AA63353F92B7@xboi05.boi.hp.com>
References: <CBD6266EA291D5118144009027AA63353F92B7@xboi05.boi.hp.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 22 Jan 2002 17:26:19 -0800
Message-ID: <1011749179.28944.262.camel@zeus>
Mime-Version: 1.0
Sender: owner-linux-mips@oss.sgi.com
To: "TWEDE,ROGER    (HP-Boise,ex1)" <roger_twede@hp.com>
Cc: linux-mips <linux-mips@oss.sgi.com>
Message-ID: <20020123012619.9zyyoLtsHxNKpi3vV8zTNknr0YgdDhb2oIHwi4ikrj8@z>

On Tue, 2002-01-22 at 17:15, TWEDE,ROGER (HP-Boise,ex1) wrote:
> 
> Are there any plans to provide full MIPS irq support in the general mips irq
> code?
> 
> The only machine that appears to attempt to fully support the MIPS interrupt
> set currently is the gt64120/momenco_ocelot machine.
 
> It uses the define CP0_S1_INTCONTROL ($20) to get at the upper interrupt
> lines ( > 8 ).

That's really a QED rm7k cpu feature, not a mips generic one.
 
> Anyone else find that support for this MIPS hardware would be best placed in
> the standard irq code rather than each machine variant having to
> re-implement it itself (as the irq code was in the past).

Might be a good feature for arch/mips/kernel/irq_cpu.c and it wouldn't
be difficult to add.  I don't think arch/mips/kernel/irq.c needs to
change.

Pete
