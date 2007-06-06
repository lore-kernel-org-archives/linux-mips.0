Received: from wf1.mips-uk.com ([194.74.144.154]:3044 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20027113AbXFFTL1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 6 Jun 2007 20:11:27 +0100
Date: Wed, 6 Jun 2007 20:04:34 +0100
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: Tickless/dyntick kernel, highres timer and general time
	crapectomy
Message-ID: <20070606190434.GA10874@linux-mips.org>
References: <20070606185450.GA10511@linux-mips.org> <46670559.4000907@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46670559.4000907@ru.mvista.com>
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20070606190434.CKJpoAS7F9E6OQVDIgykHdKxBw95xReBkx4I0CznxeM@z>

On Wed, Jun 06, 2007 at 11:04:57PM +0400, Sergei Shtylyov wrote:

> >Particularly Alchemy (and any other system supporting clock scaling) will
> >need some work there since the cp0 count/compare timer are not useful on
> >such systems.
> 
>    Hm, why it's being used then? :-)
