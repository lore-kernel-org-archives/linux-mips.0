Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:43970 "EHLO
	lxorguk.ukuu.org.uk") by ftp.linux-mips.org with ESMTP
	id S24079689AbYLCPrH (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 3 Dec 2008 15:47:07 +0000
Date: Wed, 3 Dec 2008 15:46:58 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 4/4] Serial: UART driver changes for Cavium OCTEON.
Message-ID: <20081203154658.7f54144c@lxorguk.ukuu.org.uk>
In-Reply-To: <1228175368-5536-4-git-send-email-ddaney@caviumnetworks.com>
References: <4934774E.6080805@caviumnetworks.com>
	<1228175368-5536-4-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <alan@lxorguk.ukuu.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-serial@vger.kernel.org, akpm@linux-foundation.org, linux-mips@linux-mips.org, Tomaso Paoletti <tpaoletti@caviumnetworks.com>
Message-ID: <20081203154658.VQEzzWs5zpsQArdvZItg4CmbZPydExhzJD65emg-9Ww@z>

On Mon,  1 Dec 2008 15:49:28 -0800
David Daney <ddaney@caviumnetworks.com> wrote:

> Cavium UART implementation is not covered by existing uart_configS.
> Define a new uart_config (PORT_OCTEON) which is specified by OCTEON
> platform device registration code.

All 4 queued
