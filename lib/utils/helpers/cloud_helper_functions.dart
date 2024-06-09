import 'package:flutter/material.dart';

class UCloudHelperFunctions {
  // Any type of snapshot state
  static Widget? checkingSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    // Still waiting
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // No Data
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text('No Data Found!'),
      );
    }

    // Error
    if (snapshot.hasError) {
      return const Center(
        child: Text('Something went wrong!'),
      );
    }

    return null;
  }

  // List of snapshots
  static Widget? checkMultiRecordState<T>(
      {required AsyncSnapshot<List<T>> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    // Still waiting
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // No Data
    if (!snapshot.hasData || snapshot.data == null) {
      if (nothingFound != null) {
        return nothingFound;
      } else {
        return const Center(
          child: Text('No Data Found!'),
        );
      }
    }

    // Error
    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(
        child: Text('Something went wrong!'),
      );
    }

    return null;
  }
}
