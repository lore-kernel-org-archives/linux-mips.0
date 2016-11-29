Received: from mail-cys01nam02on0061.outbound.protection.outlook.com ([104.47.37.61]:32650
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992128AbcK2SWrqWDJ3 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 29 Nov 2016 19:22:47 +0100
Subject: Re: [PATCH v2 0/3] i2c: octeon: thunder: Fix i2c not working on
 Octeon
References: <1479149445-4663-1-git-send-email-jglauber@cavium.com>
 <99500824-4c63-b769-ad66-c136529b14b2@cavium.com>
 <20161122120106.GB3993@katana> <20161122145539.GA7716@hardcore>
 <20161128142208.GA3916@katana> <20161129091928.GB29487@hardcore>
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <52c6e31e-9351-fa26-aefe-4f1415324adf@cavium.com>
Date: Tue, 29 Nov 2016 12:22:34 -0600
MIME-Version: 1.0
In-Reply-To: <20161129091928.GB29487@hardcore>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jan Glauber <jan.glauber@caviumnetworks.com>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>, David Daney <david.daney@cavium.com>
Message-ID: <20161129182234.Qm4L_vgYeMDI0tkFC0fQoI4FaWjFGpIKapFFUcMQvdY@z>

On 11/29/2016 03:19 AM, Jan Glauber wrote:
> 
> if possible we should at least revert commit 70121f7f3725. I should get
> access to an Octeon 71xx board tomorrow, but I'm afraid we'll miss the
> deadline for a well tested fix that works across all machines.
> 
I second Jan's advice. Please revert the commit and we'll have the
fix for the next release.
