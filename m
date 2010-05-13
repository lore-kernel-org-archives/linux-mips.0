Received: from rtp-iport-1.cisco.com ([64.102.122.148]:50668 "EHLO
        rtp-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492324Ab0EMSuM convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 13 May 2010 20:50:12 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [RFC PATCH 1/2] The Device Tree Patch for MIPS
Date: Thu, 13 May 2010 13:50:04 -0500
Message-ID: <7A9214B0DEB2074FBCA688B30B04400DC64936@XMB-RCD-208.cisco.com>
In-Reply-To: <4BEAE438.7080303@caviumnetworks.com>
From: "Dezhong Diao (dediao)" <dediao@cisco.com>
Return-Path: <dediao@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>, "Tony Colclough (colclot)" <colclot@cisco.com>, Grant Likely <grant.likely@secretlab.ca>
Message-ID: <20100513185004.5rVB31vpUtaKGHBXpQmGljpDCrYtcQ8hnAEtrQ7mv7k@z>

>> +/* which is compatible with the flattened device tree (FDT) */ 
>> +#define cmd_line arcs_cmdline

>What is this #define floating in space?

The variable "cmd_line" is being used in generic code of device tree,
most of platforms (ARM, POWERPC
, etc) have its definition, but it isn't present in MIPS. Actually there
is a variable "arcs_cmdline" to be used as the same purpose in MIPS,
that is the reason "arcs_cmdline" is given a new name.


Thanks


Dezhong
