Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:32722 "EHLO
	lxorguk.ukuu.org.uk") by ftp.linux-mips.org with ESMTP
	id S21365986AbZAOVNT (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 15 Jan 2009 21:13:19 +0000
Date: Thu, 15 Jan 2009 21:13:33 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 2/2] libata: New driver for OCTEON SOC Compact Flash
 interface (v6).
Message-ID: <20090115211333.1440db46@lxorguk.ukuu.org.uk>
In-Reply-To: <1232053053-16232-2-git-send-email-ddaney@caviumnetworks.com>
References: <496FA2E9.9030403@caviumnetworks.com>
	<1232053053-16232-2-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <alan@lxorguk.ukuu.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-ide@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20090115211333.8-rB6bJgSh-TBDeEYxie7D7Syy7UEiJX327Hhsqghdg@z>

> +	reg_cfg.s.orbit = 0;	/* Don't combine with previos region */

previous ...


> +static unsigned int octeon_cf_qc_issue(struct ata_queued_cmd *qc)
> +	case ATAPI_PROT_DMA:
> +		dev_err(ap->dev, "Error, ATAPI not supported\n");
> +		BUG();

Looks as if you should also have a check_atapi_dma function that always
returns non zero (or a mode filter for atapi -> pio)


Looks good to me.
