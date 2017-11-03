Received: from vps0.lunn.ch ([185.16.172.187]:49238 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990588AbdKCPsOZwPKt (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 3 Nov 2017 16:48:14 +0100
Date: Fri, 3 Nov 2017 16:48:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 6/7] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Message-ID: <20171103154811.GS24320@lunn.ch>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-7-david.daney@cavium.com>
 <55d6cf88-7444-42ea-02f1-27efdee2be4b@gmail.com>
 <ee206580-e419-903f-de36-72d5803b1b7b@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee206580-e419-903f-de36-72d5803b1b7b@caviumnetworks.com>
Return-Path: <andrew@lunn.ch>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney@caviumnetworks.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Carlos Munoz <cmunoz@cavium.com>

> >>+static char *mix_port;
> >>+module_param(mix_port, charp, 0444);
> >>+MODULE_PARM_DESC(mix_port, "Specifies which ports connect to MIX interfaces.");
> >
> >Can you derive this from Device Tree /platform data configuration?
> >
> >>+
> >>+static char *pki_port;
> >>+module_param(pki_port, charp, 0444);
> >>+MODULE_PARM_DESC(pki_port, "Specifies which ports connect to the PKI.");
> >
> >Likewise
> 
> The SoC is flexible in how it is configured.  Technically the device tree
> should only be used to specify information about the physical configuration
> of the system that cannot be probed for, and this is about policy rather
> that physical wiring.  That said, we do take the default configuration from
> the device tree, but give the option here to override via the module command
> line.

Module parameters are pretty much frowned upon. 

You should really try to remove them all, if possible.

> >>+/* Registers are accessed via xkphys */
> >>+#define SSO_BASE			0x1670000000000ull
> >>+#define SSO_ADDR(node)			(SET_XKPHYS + NODE_OFFSET(node) +      \
> >>+					 SSO_BASE)
> >>+#define GRP_OFFSET(grp)			((grp) << 16)
> >>+#define GRP_ADDR(n, g)			(SSO_ADDR(n) + GRP_OFFSET(g))
> >>+#define SSO_GRP_AQ_CNT(n, g)		(GRP_ADDR(n, g)		   + 0x20000700)
> >>+
> >>+#define MIO_PTP_BASE			0x1070000000000ull
> >>+#define MIO_PTP_ADDR(node)		(SET_XKPHYS + NODE_OFFSET(node) +      \
> >>+					 MIO_PTP_BASE)
> >>+#define MIO_PTP_CLOCK_CFG(node)		(MIO_PTP_ADDR(node)		+ 0xf00)
> >>+#define MIO_PTP_CLOCK_HI(node)		(MIO_PTP_ADDR(node)		+ 0xf10)
> >>+#define MIO_PTP_CLOCK_COMP(node)	(MIO_PTP_ADDR(node)		+ 0xf18)
> >
> >I am sure this will work great on anything but MIPS64 ;)
> 
> Sarcasm duly noted.
> 
> That said, by definition it is exactly an OCTEON-III/MIPS64, and can never
> be anything else.  It is known a priori that the hardware and this driver
> will never be used anywhere else.

Please make sure your Kconfig really enforces this. Generally, we
suggest allowing the driver to be compiled when COMPILE_TEST is set.
That gives you better compiler test coverage. But it seems like this
driver won't compile under such conditions.

> >>+static int num_packet_buffers = 768;
> >>+module_param(num_packet_buffers, int, 0444);
> >>+MODULE_PARM_DESC(num_packet_buffers,
> >>+		 "Number of packet buffers to allocate per port.");
> >
> >Consider implementing ethtool -g/G for this.
> 
> That may be work for a follow-on patch.

Then please remove the module parameter now.

> >>+static int rx_queues = 1;
> >>+module_param(rx_queues, int, 0444);
> >>+MODULE_PARM_DESC(rx_queues, "Number of RX threads per port.");
> >
> >Same thing, can you consider using an ethtool knob for that?
> 
> Also may be work for a follow-on patch.

Ditto

> >>+/**
> >>+ * Reads a 64 bit value from the processor local scratchpad memory.
> >>+ *
> >>+ * @param offset byte offset into scratch pad to read
> >>+ *
> >>+ * @return value read
> >>+ */
> >>+static inline u64 scratch_read64(u64 offset)
> >>+{
> >>+	return *(u64 *)((long)SCRATCH_BASE + offset);
> >>+}
> >
> >No barriers needed whatsoever?
> 
> Nope.

Then it would be good to add a comment about why no barrier is
needed. Otherwise people are going to ask why there is no barrier,
submit patches adding barriers, etc.

       Andrew
