Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:3790 "EHLO
	lxorguk.ukuu.org.uk") by ftp.linux-mips.org with ESMTP
	id S23796450AbYKTUGX (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 20 Nov 2008 20:06:23 +0000
Date: Thu, 20 Nov 2008 20:06:30 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 23/26] Serial: UART driver changes for Cavium OCTEON.
Message-ID: <20081120200630.33111a2f@lxorguk.ukuu.org.uk>
In-Reply-To: <1227047057-4911-5-git-send-email-ddaney@caviumnetworks.com>
References: <49233FDE.3010404@caviumnetworks.com>
	<1227047057-4911-5-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <alan@lxorguk.ukuu.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, linux-serial@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Tomaso Paoletti <tpaoletti@caviumnetworks.com>
Message-ID: <20081120200630.wYPcVh42ewtG9Ti8rRJvbe22WH514TuJau-VYiyvxfw@z>

> +		if ((up->bugs & UART_BUG_OCTEON_IIR) && (iir & 0xf) == 7) {
> +			/* Busy interrupt */
> +			serial_in(up, UART_OCTEON_USR);
> +			iir = serial_in(up, UART_IIR);
> +		}

Could this not be hidden in the register read method for the octeon and
thus kept out of core code ?
