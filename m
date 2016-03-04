Received: from mailapp01.imgtec.com ([195.59.15.196]:54698 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007714AbcCDBllgLaqU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Mar 2016 02:41:41 +0100
Date: Fri, 4 Mar 2016 01:41:32 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 0/2] SIGFPE/SIGTRAP sending updates
Message-ID: <alpine.DEB.2.00.1603031303500.9427@tp.orcam.me.uk>
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
Cc: Pedro Alves <palves@redhat.com>, Luis Machado <lgustavo@codesourcery.com>, linux-mips@linux-mips.org
Message-ID: <20160304014132.4777KjH5viil2kxs7ItJUqIX0eB3bV8OYUJxiBlX4ik@z>

Hi,

 This was meant to be a single SIGTRAP ABI correction patch for debugger 
support, but in the course of implementation I discovered information 
leaks in signal passing from trap handlers, affecting code to be written, 
so these are fixed first in this patch pair.

  Maciej
