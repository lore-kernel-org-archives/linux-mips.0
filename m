Received: from mga01.intel.com ([192.55.52.88]:1786 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6819996Ab3DDHtJDTEr7 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 4 Apr 2013 09:49:09 +0200
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH v3 0/1] Chipidea driver support for the AR933x platform
In-Reply-To: <1365026686-4131-1-git-send-email-svetoslav@neykov.name>
References: <1365026686-4131-1-git-send-email-svetoslav@neykov.name>
Date: Thu, 04 Apr 2013 10:51:02 +0300
Message-ID: <87zjxeentl.fsf@ashishki-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <alexander.shishkin@linux.intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Svetoslav Neykov <svetoslav@neykov.name>, linux-mips@linux-mips.org, linux-usb@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Gabor Juhos <juhosg@openwrt.org>, John Crispin <blogic@openwrt.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>
Message-ID: <20130404075102.iYkFLPWh9WGvmreug1E-qx04nkHkWw44U0nU9XB4ozA@z>

Svetoslav Neykov <svetoslav@neykov.name> writes:

> Add support for the usb controller in AR933x platform.
> The controller supports both host or device mode (defined at startup) 
> but not OTG. 
> The patches are tested on WR703n router running OpenWRT in device mode.

You forgot to mention the dependencies, dr_mode in usb core and dr_mode
in ci13xxx_platform_data, which are not there yet.

Regards,
--
Alex
