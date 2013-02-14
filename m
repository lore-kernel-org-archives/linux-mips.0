Received: from mga14.intel.com ([143.182.124.37]:62945 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823072Ab3BNLHLPTpip (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 14 Feb 2013 12:07:11 +0100
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH 5/5] usb: chipidea: Fix incorrect check of function return value
In-Reply-To: <1360791538-6332-6-git-send-email-svetoslav@neykov.name>
References: <1360791538-6332-1-git-send-email-svetoslav@neykov.name> <1360791538-6332-6-git-send-email-svetoslav@neykov.name>
Date: Thu, 14 Feb 2013 13:08:36 +0200
Message-ID: <87a9r7b1aj.fsf@ashishki-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
To: Svetoslav Neykov <svetoslav@neykov.name>, Ralf Baechle <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gabor Juhos <juhosg@openwrt.org>, John Crispin <blogic@openwrt.org>, Alan Stern <stern@rowland.harvard.edu>, "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>
Cc: linux-mips@linux-mips.org, linux-usb@vger.kernel.org
Message-ID: <20130214110836.dPzOBRSpdsk6kHpbSGGv3pBoUGfYPikd9TCDPYUzcko@z>

Svetoslav Neykov <svetoslav@neykov.name> writes:

> Use the correct variable to check for the return value of the last function.

This one is fixed already by Julia Lawall: 5c6e9bf0

Regards,
--
Alex
