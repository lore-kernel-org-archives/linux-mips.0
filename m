Received: from mail-sn1nam02on0076.outbound.protection.outlook.com ([104.47.36.76]:2752
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993103AbdKBAgyRPffm (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 2 Nov 2017 01:36:54 +0100
From: David Daney <david.daney@cavium.com>
Subject: [PATCH 4/7] MIPS: Octeon: Add Free Pointer Unit (FPA) support.
Date: Wed,  1 Nov 2017 17:36:03 -0700
Message-ID: <20171102003606.19913-5-david.daney@cavium.com>
In-Reply-To: <20171102003606.19913-1-david.daney@cavium.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Carlos Munoz <cmunoz@cavium.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, David Daney <david.daney@cavium.com>
Message-ID: <20171102003603.iGjSb-q8ARxZ9qGVTEhaj97MPxrJPPciJvW1vtLhwjo@z>

From: Carlos Munoz <cmunoz@cavium.com>
