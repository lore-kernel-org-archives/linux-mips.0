Received: from mailapp01.imgtec.com ([195.59.15.196]:17654 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008725AbcA3JIIOf8XN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 30 Jan 2016 10:08:08 +0100
Date: Sat, 30 Jan 2016 09:08:01 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 0/3] A bunch of RDHWR emulation bug fixes
Message-ID: <alpine.DEB.2.00.1601300356250.5958@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20160130090801.RuzXDrhJhIdNxhjOorhk2TZgZvtvLESY1Hlm-Uego-Q@z>

Ralf,

 As I investigated legacy SYNC support I came across a number of issues 
with RDHWR emulation, located nearby.  This mini patch set addresses these 
problems, please apply.  As these are bug fixes I think there is no need 
to wait for the next rc1 stage.

  Maciej
