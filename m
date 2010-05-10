Received: from rtp-iport-2.cisco.com ([64.102.122.149]:49427 "EHLO
        rtp-iport-2.cisco.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492457Ab0EJVcm convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 10 May 2010 23:32:42 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: [RFC PATCH 0/2] The Device Tree Patch for MIPS
Date: Mon, 10 May 2010 16:32:34 -0500
Message-ID: <7A9214B0DEB2074FBCA688B30B04400DC64133@XMB-RCD-208.cisco.com>
From: "Dezhong Diao (dediao)" <dediao@cisco.com>
Return-Path: <dediao@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>, "Tony Colclough (colclot)" <colclot@cisco.com>, Grant Likely <grant.likely@secretlab.ca>
Message-ID: <20100510213234.2ST0yE-6IQ7eEcUChz1LZM2X9a4ai1yCFXVYhD_e0iM@z>

The device tree applies an ascii format to describe a hardware layout,
which is then converted into a flattened binary representation by dtc
(the "device tree compiler"). A bootloader supporting device trees loads
the flattened device tree into memory as a binary blob, and passes the
linux kernel a pointer to this blob. The kernel then uses a built-in
device tree parser to interpret the hardware layout.

The device tree code had been in some of platforms (powerpc, sparc, and
microblaze) for a long period, it has been ported to ARM platform
recently. Grant Likely (the device tree maintainer,
glikely@secretlab.ca) has put a lot of effort to eliminate the
duplication in arch-specific code (like prior 2.6.33.1 kernel) so that
it becomes easy to get the device tree working with a new platform.

The patches are intended to support the device tree in MIPS. It is
ported against the new test branch (git://git.secretlab.ca/git/linux-2.6
test-devicetree).


Dezhong
