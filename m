Received: from mail1.windriver.com ([147.11.146.13]:64253 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026906AbbFBWnSmM1ZC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Jun 2015 00:43:18 +0200
Date: Tue, 2 Jun 2015 18:43:04 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 3/4] mips: make loongsoon serial driver explicitly modular
Message-ID: <20150602224304.GH29898@windriver.com>
References: <1433276168-21550-1-git-send-email-paul.gortmaker@windriver.com>
 <1433276168-21550-4-git-send-email-paul.gortmaker@windriver.com>
 <1433281628.2361.93.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1433281628.2361.93.camel@x220>
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20150602224304.IaMPfGXcWFpynsj4UoNZP6PVLbJKaE6A2J4fN_dD9Ho@z>

[Re: [PATCH 3/4] mips: make loongsoon serial driver explicitly modular] On 02/06/2015 (Tue 23:47) Paul Bolle wrote:

> On Tue, 2015-06-02 at 16:16 -0400, Paul Gortmaker wrote:
> > +static void __init serial_exit(void)
> 
> s/__init/__exit/

Argh, yes thanks for spotting that copy-n-waste error.  Will fix.

Paul.
--

> 
> > +{
> > +	platform_device_unregister(&uart8250_device);
> > +}
> > +module_exit(serial_exit);
> 
> 
> Paul Bolle
> 
