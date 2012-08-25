Received: from netrider.rowland.org ([192.131.102.5]:37888 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1903558Ab2HYUs6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 25 Aug 2012 22:48:58 +0200
Date: Sat, 25 Aug 2012 16:48:54 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH V3] usb: gadget: bcm63xx UDC driver
In-Reply-To: <CAJiQ=7Da5CdoQ2e=CutFt32xRXqUGHitCC+GJMzvbUUPC5yQzQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1208251646130.389-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Kevin Cernekee <cernekee@gmail.com>
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, balbi@ti.com, ralf@linux-mips.org, linux-mips@linux-mips.org, linux-usb@vger.kernel.org
Message-ID: <20120825204854.ORNA2NFu9l8vckowcnaps9MkHA3Om3JkEYGbm6sW7ng@z>

On Sat, 25 Aug 2012, Kevin Cernekee wrote:

> I am hoping that these invalid SET_CONFIGURATION / SET_INTERFACE
> requests are uncommon.  In what sorts of situations will a host
> request a configuration that isn't advertised in the device's
> descriptors?  I had trouble just convincing usb_set_interface() /
> usb_driver_set_configuration() to send such a request because they
> honor bInterfaceNumber / bConfigurationValue from the descriptors.

A request doesn't have to be invalid to fail.  Valid requests can fail
for all sorts of reasons.  -ENOMEM is the prototypical example.

Alan Stern
