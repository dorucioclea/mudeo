import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mudeo/data/models/artist_model.dart';
import 'package:mudeo/redux/app/app_actions.dart';

class ViewArtistList implements PersistUI {
  ViewArtistList(this.context);

  final BuildContext context;
}

class EditArtist implements PersistUI {
  EditArtist({this.artist, this.context});

  final ArtistEntity artist;
  final BuildContext context;
}

class UpdateArtist implements PersistUI {
  UpdateArtist(this.artist);

  final ArtistEntity artist;
}

class LoadArtists {
  LoadArtists({this.completer, this.force = false});

  final Completer completer;
  final bool force;
}

class LoadArtistsRequest implements StartLoading {}

class LoadArtistsFailure implements StopLoading {
  LoadArtistsFailure(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'LoadArtistsFailure{error: $error}';
  }
}

class LoadArtistsSuccess implements PersistData, StopLoading {
  LoadArtistsSuccess(this.artists);

  final BuiltList<ArtistEntity> artists;

  @override
  String toString() {
    return 'LoadArtistsSuccess{artists: $artists}';
  }
}

class SaveArtistRequest implements StartSaving {
  SaveArtistRequest({this.artist, this.completer});

  final Completer completer;
  final ArtistEntity artist;
}

class SaveArtistSuccess implements StopSaving, PersistData, PersistUI {
  SaveArtistSuccess(this.artist);

  final ArtistEntity artist;
}

class AddArtistSuccess implements StopSaving, PersistData, PersistUI {
  AddArtistSuccess(this.artist);

  final ArtistEntity artist;
}

class SaveArtistFailure implements StopSaving {
  SaveArtistFailure(this.error);

  final Object error;
}

class FilterArtists {
  FilterArtists(this.filter);

  final String filter;
}

class SortArtists implements PersistUI {
  SortArtists(this.field);

  final String field;
}