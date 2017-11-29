Received: from mail-by2nam01on0040.outbound.protection.outlook.com ([104.47.34.40]:6176
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990490AbdK2A5i0R20i (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 29 Nov 2017 01:57:38 +0100
From: David Daney <david.daney@cavium.com>
Subject: [PATCH v4 4/8] MIPS: Octeon: Add Free Pointer Unit (FPA) support.
Date: Tue, 28 Nov 2017 16:55:36 -0800
Message-ID: <20171129005540.28829-5-david.daney@cavium.com>
In-Reply-To: <20171129005540.28829-1-david.daney@cavium.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
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
To: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Carlos Munoz <cmunoz@cavium.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, David Daney <david.daney@cavium.com>
Message-ID: <20171129005536.bkk5IGgWO-ZL3VJn7WdtT6glrxwlKz6gsJrOhNZ9Eqg@z>

From: Carlos Munoz <cmunoz@cavium.com>
