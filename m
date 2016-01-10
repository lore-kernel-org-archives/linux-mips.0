Received: from dub004-omc3s14.hotmail.com ([157.55.2.23]:54135 "EHLO
        DUB004-OMC3S14.hotmail.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006823AbcAJVx4cOwxG convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 10 Jan 2016 22:53:56 +0100
Message-ID: <DUB128-W482D8922008A1EB108523C9CC80@phx.gbl>
From: David Binderman <dcb314@hotmail.com>
Subject: linux-4.4-rc8/arch/mips/include/asm/netlogic/xlr/fmn.h:304: bad
 test ?
Date: Sun, 10 Jan 2016 21:53:50 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <dcb314@hotmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "ralf@linux-mips.org" <ralf@linux-mips.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20160110215350.Iqi68M1cBXjcY_ciWU6JfXn2yJ7C8NeskJmQ7KoeGbM@z>

Hello there,

[linux-4.4-rc8/arch/mips/include/asm/netlogic/xlr/fmn.h:304]: (style) Expression '(X & 0x2) == 0x1' is always false.

Source code is

    if ((status & 0x2) == 1)
            pr_info("Send pending fail!\n");

Maybe better code

    if ((status & 0x2) != 0)
            pr_info("Send pending fail!\n");

Regards

David Binderman

 		 	   		  
