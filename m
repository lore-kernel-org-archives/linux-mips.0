Received: from mx0.aculab.com ([213.249.233.131]:49075 "HELO mx0.aculab.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with SMTP
        id S6823083Ab3FTLfg2gjyp convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Jun 2013 13:35:36 +0200
Received: from mx0.aculab.com ([127.0.0.1])
 by localhost (mx0.aculab.com [127.0.0.1]) (amavisd-new, port 10024) with SMTP
 id 23840-01 for <linux-mips@linux-mips.org>;
 Thu, 20 Jun 2013 12:35:28 +0100 (BST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH 2/2] netdev: octeon_mgmt: Fix structure layout for little-endian.
Date: Thu, 20 Jun 2013 10:47:57 +0100
Message-ID: <AE90C24D6B3A694183C094C60CF0A2F6026B729B@saturn3.aculab.com>
In-Reply-To: <1371688820-4585-3-git-send-email-ddaney.cavm@gmail.com>
References: <1371688820-4585-1-git-send-email-ddaney.cavm@gmail.com> <1371688820-4585-3-git-send-email-ddaney.cavm@gmail.com>
From: "David Laight" <David.Laight@ACULAB.COM>
Return-Path: <David.Laight@ACULAB.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20130620094757.QiPs8zU19GkM5Vou-QwpJoPRj9I2gpDMvKASiSRIJQM@z>

> The C ABI reverses the bitfield fill order when compiled as
> little-endian.

No - it is completely implementation defined.
The general concensus is not to use bitfields if you
care at all about the bit assignments.

	David
